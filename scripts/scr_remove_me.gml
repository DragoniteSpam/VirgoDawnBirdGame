/// void scr_set_alive(ArgSet);
/* Removes a Selectable from the game world. Permenantly.
 * In most cases you probably don't want to do this. Use "setAlive" instead.
 * Arguments:
 *   - None
 */

remove_entity(id);

// Don't bother continuing here, since continuing with deleted
// entites could make things unstable.
// This should always be called at the end of a cutscene.

World.keep_going=false;
