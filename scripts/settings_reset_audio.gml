#define settings_reset_audio
volume_effect=DEFAULT_VOLUME;
volume_music=DEFAULT_VOLUME;
volume_system=DEFAULT_VOLUME;
volume_global=DEFAULT_VOLUME_MAX-1;
volume_environmental=DEFAULT_VOLUME div 2;

settings_reset_audio_levels();

#define settings_reset_audio_levels
audio_group_set_gain(AGEffects, volume_effect*volume_global/81, 0);
audio_group_set_gain(AGEnvironmental, volume_environmental*volume_global/81, 0);
audio_group_set_gain(AGSystem, volume_system*volume_global/81, 0);
audio_group_set_gain(AGMusic, volume_music*volume_global/81, 0);