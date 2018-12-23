#define eval
/// float EVAL(expression);

// Works for the mathematical operations in the split() expression.
// Carrot^ for power is not supported.

if (string_count("(", argument0)!=string_count(")", argument0)){
    eval_error("Mismatched parenthesis:##"+argument0);
}
//var q=split(argument0, ",()+-/*", true);
var q=split(argument0, " ");

var output_q=ds_queue_create();
var operator_stack=ds_stack_create();

while (!ds_queue_empty(q)){
    var token=string_trim(deq(q));
    // i hate that validate_double validates single + or - and i have to do this
    if (validate_double(token)&&token!="+"&&token!="-"){
        ds_queue_enqueue(output_q, token);
    } else if (validate_function(token)){
        ds_stack_push(operator_stack, token);
    } else if (validate_operator(token)){
        while (ds_stack_size(operator_stack)>0&&((validate_function(ds_stack_top(operator_stack))||
                eval_operator_precedence(ds_stack_top(operator_stack))>eval_operator_precedence(token))||
                eval_operator_precedence(ds_stack_top(operator_stack))==eval_operator_precedence(token)&&eval_left_associative(token)&&
                ds_stack_top(operator_stack)!="(")){
            ds_queue_enqueue(output_q, ds_stack_pop(operator_stack));
        }
        ds_stack_push(operator_stack, token);
    } else if (token=="("){
        ds_stack_push(operator_stack, token);
    } else if (token==")"){
        while (ds_stack_top(operator_stack)!="("){
            ds_queue_enqueue(output_q, ds_stack_pop(operator_stack));
        }
        // Proved to be a ( character
        ds_stack_pop(operator_stack);
    // Variable
    } else {
        ds_queue_enqueue(output_q, token);
    }
}

while (!ds_stack_empty(operator_stack)){
    ds_queue_enqueue(output_q, ds_stack_pop(operator_stack));
}

var onemorestack=ds_stack_create();

while (!ds_queue_empty(output_q)){
    var token=deq(output_q);
    if (string_length(string_trim(token))>0){
        if (validate_double(token)&&token!="+"&&token!="-"){
            ds_stack_push(onemorestack, real_with_bool(token));
        } else if (ds_map_exists(World.variables, token)){
            if (validate_double(string(World.variables[? token]))){
                ds_stack_push(onemorestack, real_with_bool(World.variables[? token]));
            } else {
                eval_error("Wrong type of variable :#"+token+"#in#"+argument0);
            }
        } else if (ds_map_exists(World.cutscene_eval_operator_operations, token)){
            var second_operand=ds_stack_pop(onemorestack);
            var first_operand=ds_stack_pop(onemorestack);
            var operator=World.cutscene_eval_operator_operations[? token];
            ds_stack_push(onemorestack, script_execute(operator, first_operand, second_operand));
        } else if (ds_map_exists(World.cutscene_eval_functions, token)){
            var script=World.cutscene_eval_functions[? token];
            switch (World.cutscene_eval_function_arguments[? token]){
                case 1:
                    var param=ds_stack_pop(onemorestack);
                    ds_stack_push(onemorestack, script_execute(script, param));
                    break;
                case 2:
                    var param2=ds_stack_pop(onemorestack);
                    var param1=ds_stack_pop(onemorestack);
                    ds_stack_push(onemorestack, script_execute(script, param1, param2));
                    break;
            }
        }
    }
}

var result=ds_stack_pop(onemorestack);

ds_queue_destroy(q);
ds_stack_destroy(operator_stack);
ds_queue_destroy(output_q);
ds_stack_destroy(onemorestack);

return result;

#define eval_operator_precedence
/// double eval_operator_precedence(operator);

if (ds_map_exists(World.cutscene_eval_operators, argument0)){
    return World.cutscene_eval_operators[? argument0];
}

return 1;

#define eval_error
// Theoretically you could show some more information here.

show_message(argument0);

#define eval_left_associative
// Theoretically would return false if you were to use the carrot^ operator,
// which I decided not to support anyway.

return true;