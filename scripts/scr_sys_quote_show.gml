/// void scr_sys_quote_show(ArgSet);
/* Shows (or hides) the random quote.
 * Arguments:
 *   - boolean showQuote: true if you want to show the quote, false if you want to hide it
 *   - Color color: the color of the quote
 */

World.rq_show=argument0[| 0].value;
World.rq_color=color_values[argument0[| 1].value];

World.keep_going=true;
