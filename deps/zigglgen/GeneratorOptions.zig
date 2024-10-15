// This file was generated by 'updateApiRegistry.ps1'.
// OpenGL XML API Registry revision: 9da96319b5180c55bab6f0231d384941f4d57200

api: Api,
version: Version,
profile: ?Profile = null,
extensions: []const Extension = &.{},

pub const Api = enum { gl, gles, glsc };

pub const Version = enum {
    @"1.0",
    @"1.1",
    @"1.2",
    @"1.3",
    @"1.4",
    @"1.5",
    @"2.0",
    @"2.1",
    @"3.0",
    @"3.1",
    @"3.2",
    @"3.3",
    @"4.0",
    @"4.1",
    @"4.2",
    @"4.3",
    @"4.4",
    @"4.5",
    @"4.6",
};

pub const Profile = enum { core, compatibility, common, common_lite };

pub const Extension = enum {
    @"3DFX_multisample",
    @"3DFX_tbuffer",
    @"3DFX_texture_compression_FXT1",
    AMD_blend_minmax_factor,
    AMD_compressed_3DC_texture,
    AMD_compressed_ATC_texture,
    AMD_conservative_depth,
    AMD_debug_output,
    AMD_depth_clamp_separate,
    AMD_draw_buffers_blend,
    AMD_framebuffer_multisample_advanced,
    AMD_framebuffer_sample_positions,
    AMD_gcn_shader,
    AMD_gpu_shader_half_float,
    AMD_gpu_shader_int16,
    AMD_gpu_shader_int64,
    AMD_interleaved_elements,
    AMD_multi_draw_indirect,
    AMD_name_gen_delete,
    AMD_occlusion_query_event,
    AMD_performance_monitor,
    AMD_pinned_memory,
    AMD_program_binary_Z400,
    AMD_query_buffer_object,
    AMD_sample_positions,
    AMD_seamless_cubemap_per_texture,
    AMD_shader_atomic_counter_ops,
    AMD_shader_ballot,
    AMD_shader_explicit_vertex_parameter,
    AMD_shader_gpu_shader_half_float_fetch,
    AMD_shader_image_load_store_lod,
    AMD_shader_stencil_export,
    AMD_shader_trinary_minmax,
    AMD_sparse_texture,
    AMD_stencil_operation_extended,
    AMD_texture_gather_bias_lod,
    AMD_texture_texture4,
    AMD_transform_feedback3_lines_triangles,
    AMD_transform_feedback4,
    AMD_vertex_shader_layer,
    AMD_vertex_shader_tessellator,
    AMD_vertex_shader_viewport_index,
    ANDROID_extension_pack_es31a,
    ANGLE_depth_texture,
    ANGLE_framebuffer_blit,
    ANGLE_framebuffer_multisample,
    ANGLE_instanced_arrays,
    ANGLE_pack_reverse_row_order,
    ANGLE_program_binary,
    ANGLE_texture_compression_dxt3,
    ANGLE_texture_compression_dxt5,
    ANGLE_texture_usage,
    ANGLE_translated_shader_source,
    APPLE_aux_depth_stencil,
    APPLE_client_storage,
    APPLE_clip_distance,
    APPLE_color_buffer_packed_float,
    APPLE_copy_texture_levels,
    APPLE_element_array,
    APPLE_fence,
    APPLE_float_pixels,
    APPLE_flush_buffer_range,
    APPLE_framebuffer_multisample,
    APPLE_object_purgeable,
    APPLE_rgb_422,
    APPLE_row_bytes,
    APPLE_specular_vector,
    APPLE_sync,
    APPLE_texture_2D_limited_npot,
    APPLE_texture_format_BGRA8888,
    APPLE_texture_max_level,
    APPLE_texture_packed_float,
    APPLE_texture_range,
    APPLE_transform_hint,
    APPLE_vertex_array_object,
    APPLE_vertex_array_range,
    APPLE_vertex_program_evaluators,
    APPLE_ycbcr_422,
    ARB_ES2_compatibility,
    ARB_ES3_1_compatibility,
    ARB_ES3_2_compatibility,
    ARB_ES3_compatibility,
    ARB_arrays_of_arrays,
    ARB_base_instance,
    ARB_bindless_texture,
    ARB_blend_func_extended,
    ARB_buffer_storage,
    ARB_cl_event,
    ARB_clear_buffer_object,
    ARB_clear_texture,
    ARB_clip_control,
    ARB_color_buffer_float,
    ARB_compatibility,
    ARB_compressed_texture_pixel_storage,
    ARB_compute_shader,
    ARB_compute_variable_group_size,
    ARB_conditional_render_inverted,
    ARB_conservative_depth,
    ARB_copy_buffer,
    ARB_copy_image,
    ARB_cull_distance,
    ARB_debug_output,
    ARB_depth_buffer_float,
    ARB_depth_clamp,
    ARB_depth_texture,
    ARB_derivative_control,
    ARB_direct_state_access,
    ARB_draw_buffers,
    ARB_draw_buffers_blend,
    ARB_draw_elements_base_vertex,
    ARB_draw_indirect,
    ARB_draw_instanced,
    ARB_enhanced_layouts,
    ARB_explicit_attrib_location,
    ARB_explicit_uniform_location,
    ARB_fragment_coord_conventions,
    ARB_fragment_layer_viewport,
    ARB_fragment_program,
    ARB_fragment_program_shadow,
    ARB_fragment_shader,
    ARB_fragment_shader_interlock,
    ARB_framebuffer_no_attachments,
    ARB_framebuffer_object,
    ARB_framebuffer_sRGB,
    ARB_geometry_shader4,
    ARB_get_program_binary,
    ARB_get_texture_sub_image,
    ARB_gl_spirv,
    ARB_gpu_shader_fp64,
    ARB_gpu_shader_int64,
    ARB_gpu_shader5,
    ARB_half_float_pixel,
    ARB_half_float_vertex,
    ARB_imaging,
    ARB_indirect_parameters,
    ARB_instanced_arrays,
    ARB_internalformat_query,
    ARB_internalformat_query2,
    ARB_invalidate_subdata,
    ARB_map_buffer_alignment,
    ARB_map_buffer_range,
    ARB_matrix_palette,
    ARB_multi_bind,
    ARB_multi_draw_indirect,
    ARB_multisample,
    ARB_multitexture,
    ARB_occlusion_query,
    ARB_occlusion_query2,
    ARB_parallel_shader_compile,
    ARB_pipeline_statistics_query,
    ARB_pixel_buffer_object,
    ARB_point_parameters,
    ARB_point_sprite,
    ARB_polygon_offset_clamp,
    ARB_post_depth_coverage,
    ARB_program_interface_query,
    ARB_provoking_vertex,
    ARB_query_buffer_object,
    ARB_robust_buffer_access_behavior,
    ARB_robustness,
    ARB_robustness_isolation,
    ARB_sample_locations,
    ARB_sample_shading,
    ARB_sampler_objects,
    ARB_seamless_cube_map,
    ARB_seamless_cubemap_per_texture,
    ARB_separate_shader_objects,
    ARB_shader_atomic_counter_ops,
    ARB_shader_atomic_counters,
    ARB_shader_ballot,
    ARB_shader_bit_encoding,
    ARB_shader_clock,
    ARB_shader_draw_parameters,
    ARB_shader_group_vote,
    ARB_shader_image_load_store,
    ARB_shader_image_size,
    ARB_shader_objects,
    ARB_shader_precision,
    ARB_shader_stencil_export,
    ARB_shader_storage_buffer_object,
    ARB_shader_subroutine,
    ARB_shader_texture_image_samples,
    ARB_shader_texture_lod,
    ARB_shader_viewport_layer_array,
    ARB_shading_language_100,
    ARB_shading_language_420pack,
    ARB_shading_language_include,
    ARB_shading_language_packing,
    ARB_shadow,
    ARB_shadow_ambient,
    ARB_sparse_buffer,
    ARB_sparse_texture,
    ARB_sparse_texture_clamp,
    ARB_sparse_texture2,
    ARB_spirv_extensions,
    ARB_stencil_texturing,
    ARB_sync,
    ARB_tessellation_shader,
    ARB_texture_barrier,
    ARB_texture_border_clamp,
    ARB_texture_buffer_object,
    ARB_texture_buffer_object_rgb32,
    ARB_texture_buffer_range,
    ARB_texture_compression,
    ARB_texture_compression_bptc,
    ARB_texture_compression_rgtc,
    ARB_texture_cube_map,
    ARB_texture_cube_map_array,
    ARB_texture_env_add,
    ARB_texture_env_combine,
    ARB_texture_env_crossbar,
    ARB_texture_env_dot3,
    ARB_texture_filter_anisotropic,
    ARB_texture_filter_minmax,
    ARB_texture_float,
    ARB_texture_gather,
    ARB_texture_mirror_clamp_to_edge,
    ARB_texture_mirrored_repeat,
    ARB_texture_multisample,
    ARB_texture_non_power_of_two,
    ARB_texture_query_levels,
    ARB_texture_query_lod,
    ARB_texture_rectangle,
    ARB_texture_rg,
    ARB_texture_rgb10_a2ui,
    ARB_texture_stencil8,
    ARB_texture_storage,
    ARB_texture_storage_multisample,
    ARB_texture_swizzle,
    ARB_texture_view,
    ARB_timer_query,
    ARB_transform_feedback_instanced,
    ARB_transform_feedback_overflow_query,
    ARB_transform_feedback2,
    ARB_transform_feedback3,
    ARB_transpose_matrix,
    ARB_uniform_buffer_object,
    ARB_vertex_array_bgra,
    ARB_vertex_array_object,
    ARB_vertex_attrib_64bit,
    ARB_vertex_attrib_binding,
    ARB_vertex_blend,
    ARB_vertex_buffer_object,
    ARB_vertex_program,
    ARB_vertex_shader,
    ARB_vertex_type_2_10_10_10_rev,
    ARB_vertex_type_10f_11f_11f_rev,
    ARB_viewport_array,
    ARB_window_pos,
    ARM_mali_program_binary,
    ARM_mali_shader_binary,
    ARM_rgba8,
    ARM_shader_core_properties,
    ARM_shader_framebuffer_fetch,
    ARM_shader_framebuffer_fetch_depth_stencil,
    ARM_texture_unnormalized_coordinates,
    ATI_draw_buffers,
    ATI_element_array,
    ATI_envmap_bumpmap,
    ATI_fragment_shader,
    ATI_map_object_buffer,
    ATI_meminfo,
    ATI_pixel_format_float,
    ATI_pn_triangles,
    ATI_separate_stencil,
    ATI_text_fragment_shader,
    ATI_texture_env_combine3,
    ATI_texture_float,
    ATI_texture_mirror_once,
    ATI_vertex_array_object,
    ATI_vertex_attrib_array_object,
    ATI_vertex_streams,
    DMP_program_binary,
    DMP_shader_binary,
    EXT_422_pixels,
    EXT_EGL_image_array,
    EXT_EGL_image_storage,
    EXT_EGL_image_storage_compression,
    EXT_EGL_sync,
    EXT_YUV_target,
    EXT_abgr,
    EXT_base_instance,
    EXT_bgra,
    EXT_bindable_uniform,
    EXT_blend_color,
    EXT_blend_equation_separate,
    EXT_blend_func_extended,
    EXT_blend_func_separate,
    EXT_blend_logic_op,
    EXT_blend_minmax,
    EXT_blend_subtract,
    EXT_buffer_storage,
    EXT_clear_texture,
    EXT_clip_control,
    EXT_clip_cull_distance,
    EXT_clip_volume_hint,
    EXT_cmyka,
    EXT_color_buffer_float,
    EXT_color_buffer_half_float,
    EXT_color_subtable,
    EXT_compiled_vertex_array,
    EXT_conservative_depth,
    EXT_convolution,
    EXT_coordinate_frame,
    EXT_copy_image,
    EXT_copy_texture,
    EXT_cull_vertex,
    EXT_debug_label,
    EXT_debug_marker,
    EXT_depth_bounds_test,
    EXT_depth_clamp,
    EXT_direct_state_access,
    EXT_discard_framebuffer,
    EXT_disjoint_timer_query,
    EXT_draw_buffers,
    EXT_draw_buffers_indexed,
    EXT_draw_buffers2,
    EXT_draw_elements_base_vertex,
    EXT_draw_instanced,
    EXT_draw_range_elements,
    EXT_draw_transform_feedback,
    EXT_external_buffer,
    EXT_float_blend,
    EXT_fog_coord,
    EXT_fragment_shading_rate,
    EXT_framebuffer_blit,
    EXT_framebuffer_blit_layers,
    EXT_framebuffer_multisample,
    EXT_framebuffer_multisample_blit_scaled,
    EXT_framebuffer_object,
    EXT_framebuffer_sRGB,
    EXT_geometry_point_size,
    EXT_geometry_shader,
    EXT_geometry_shader4,
    EXT_gpu_program_parameters,
    EXT_gpu_shader4,
    EXT_gpu_shader5,
    EXT_histogram,
    EXT_index_array_formats,
    EXT_index_func,
    EXT_index_material,
    EXT_index_texture,
    EXT_instanced_arrays,
    EXT_light_texture,
    EXT_map_buffer_range,
    EXT_memory_object,
    EXT_memory_object_fd,
    EXT_memory_object_win32,
    EXT_misc_attribute,
    EXT_multi_draw_arrays,
    EXT_multi_draw_indirect,
    EXT_multisample,
    EXT_multisampled_compatibility,
    EXT_multisampled_render_to_texture,
    EXT_multisampled_render_to_texture2,
    EXT_multiview_draw_buffers,
    EXT_multiview_tessellation_geometry_shader,
    EXT_multiview_texture_multisample,
    EXT_multiview_timer_query,
    EXT_occlusion_query_boolean,
    EXT_packed_depth_stencil,
    EXT_packed_float,
    EXT_packed_pixels,
    EXT_paletted_texture,
    EXT_pixel_buffer_object,
    EXT_pixel_transform,
    EXT_pixel_transform_color_table,
    EXT_point_parameters,
    EXT_polygon_offset,
    EXT_polygon_offset_clamp,
    EXT_post_depth_coverage,
    EXT_primitive_bounding_box,
    EXT_protected_textures,
    EXT_provoking_vertex,
    EXT_pvrtc_sRGB,
    EXT_raster_multisample,
    EXT_read_format_bgra,
    EXT_render_snorm,
    EXT_rescale_normal,
    EXT_robustness,
    EXT_sRGB,
    EXT_sRGB_write_control,
    EXT_secondary_color,
    EXT_semaphore,
    EXT_semaphore_fd,
    EXT_semaphore_win32,
    EXT_separate_depth_stencil,
    EXT_separate_shader_objects,
    EXT_separate_specular_color,
    EXT_shader_framebuffer_fetch,
    EXT_shader_framebuffer_fetch_non_coherent,
    EXT_shader_group_vote,
    EXT_shader_image_load_formatted,
    EXT_shader_image_load_store,
    EXT_shader_implicit_conversions,
    EXT_shader_integer_mix,
    EXT_shader_io_blocks,
    EXT_shader_non_constant_global_initializers,
    EXT_shader_pixel_local_storage,
    EXT_shader_pixel_local_storage2,
    EXT_shader_samples_identical,
    EXT_shader_texture_lod,
    EXT_shadow_funcs,
    EXT_shadow_samplers,
    EXT_shared_texture_palette,
    EXT_sparse_texture,
    EXT_sparse_texture2,
    EXT_stencil_clear_tag,
    EXT_stencil_two_side,
    EXT_stencil_wrap,
    EXT_subtexture,
    EXT_tessellation_point_size,
    EXT_tessellation_shader,
    EXT_texture,
    EXT_texture_array,
    EXT_texture_border_clamp,
    EXT_texture_buffer,
    EXT_texture_buffer_object,
    EXT_texture_compression_astc_decode_mode,
    EXT_texture_compression_bptc,
    EXT_texture_compression_dxt1,
    EXT_texture_compression_latc,
    EXT_texture_compression_rgtc,
    EXT_texture_compression_s3tc,
    EXT_texture_compression_s3tc_srgb,
    EXT_texture_cube_map,
    EXT_texture_cube_map_array,
    EXT_texture_env_add,
    EXT_texture_env_combine,
    EXT_texture_env_dot3,
    EXT_texture_filter_anisotropic,
    EXT_texture_filter_minmax,
    EXT_texture_format_BGRA8888,
    EXT_texture_format_sRGB_override,
    EXT_texture_integer,
    EXT_texture_lod_bias,
    EXT_texture_mirror_clamp,
    EXT_texture_mirror_clamp_to_edge,
    EXT_texture_norm16,
    EXT_texture_object,
    EXT_texture_perturb_normal,
    EXT_texture_query_lod,
    EXT_texture_rg,
    EXT_texture_sRGB,
    EXT_texture_sRGB_R8,
    EXT_texture_sRGB_RG8,
    EXT_texture_sRGB_decode,
    EXT_texture_shadow_lod,
    EXT_texture_shared_exponent,
    EXT_texture_snorm,
    EXT_texture_storage,
    EXT_texture_storage_compression,
    EXT_texture_swizzle,
    EXT_texture_type_2_10_10_10_REV,
    EXT_texture_view,
    EXT_texture3D,
    EXT_timer_query,
    EXT_transform_feedback,
    EXT_unpack_subimage,
    EXT_vertex_array,
    EXT_vertex_array_bgra,
    EXT_vertex_attrib_64bit,
    EXT_vertex_shader,
    EXT_vertex_weighting,
    EXT_win32_keyed_mutex,
    EXT_window_rectangles,
    EXT_x11_sync_object,
    FJ_shader_binary_GCCSO,
    GREMEDY_frame_terminator,
    GREMEDY_string_marker,
    HP_convolution_border_modes,
    HP_image_transform,
    HP_occlusion_test,
    HP_texture_lighting,
    IBM_cull_vertex,
    IBM_multimode_draw_arrays,
    IBM_rasterpos_clip,
    IBM_static_data,
    IBM_texture_mirrored_repeat,
    IBM_vertex_array_lists,
    IMG_bindless_texture,
    IMG_framebuffer_downsample,
    IMG_multisampled_render_to_texture,
    IMG_program_binary,
    IMG_pvric_end_to_end_signature,
    IMG_read_format,
    IMG_shader_binary,
    IMG_texture_compression_pvrtc,
    IMG_texture_compression_pvrtc2,
    IMG_texture_env_enhanced_fixed_function,
    IMG_texture_filter_cubic,
    IMG_tile_region_protection,
    IMG_user_clip_plane,
    INGR_blend_func_separate,
    INGR_color_clamp,
    INGR_interlace_read,
    INTEL_blackhole_render,
    INTEL_conservative_rasterization,
    INTEL_fragment_shader_ordering,
    INTEL_framebuffer_CMAA,
    INTEL_map_texture,
    INTEL_parallel_arrays,
    INTEL_performance_query,
    KHR_blend_equation_advanced,
    KHR_blend_equation_advanced_coherent,
    KHR_context_flush_control,
    KHR_debug,
    KHR_no_error,
    KHR_parallel_shader_compile,
    KHR_robust_buffer_access_behavior,
    KHR_robustness,
    KHR_shader_subgroup,
    KHR_texture_compression_astc_hdr,
    KHR_texture_compression_astc_ldr,
    KHR_texture_compression_astc_sliced_3d,
    MESA_bgra,
    MESA_framebuffer_flip_x,
    MESA_framebuffer_flip_y,
    MESA_framebuffer_swap_xy,
    MESA_pack_invert,
    MESA_program_binary_formats,
    MESA_resize_buffers,
    MESA_sampler_objects,
    MESA_shader_integer_functions,
    MESA_tile_raster_order,
    MESA_window_pos,
    MESA_ycbcr_texture,
    MESAX_texture_stack,
    NV_alpha_to_coverage_dither_control,
    NV_bindless_multi_draw_indirect,
    NV_bindless_multi_draw_indirect_count,
    NV_bindless_texture,
    NV_blend_equation_advanced,
    NV_blend_equation_advanced_coherent,
    NV_blend_minmax_factor,
    NV_blend_square,
    NV_clip_space_w_scaling,
    NV_command_list,
    NV_compute_program5,
    NV_compute_shader_derivatives,
    NV_conditional_render,
    NV_conservative_raster,
    NV_conservative_raster_dilate,
    NV_conservative_raster_pre_snap,
    NV_conservative_raster_pre_snap_triangles,
    NV_conservative_raster_underestimation,
    NV_copy_buffer,
    NV_copy_depth_to_color,
    NV_copy_image,
    NV_coverage_sample,
    NV_deep_texture3D,
    NV_depth_buffer_float,
    NV_depth_clamp,
    NV_depth_nonlinear,
    NV_draw_buffers,
    NV_draw_instanced,
    NV_draw_texture,
    NV_draw_vulkan_image,
    NV_evaluators,
    NV_explicit_attrib_location,
    NV_explicit_multisample,
    NV_fbo_color_attachments,
    NV_fence,
    NV_fill_rectangle,
    NV_float_buffer,
    NV_fog_distance,
    NV_fragment_coverage_to_color,
    NV_fragment_program,
    NV_fragment_program_option,
    NV_fragment_program2,
    NV_fragment_program4,
    NV_fragment_shader_barycentric,
    NV_fragment_shader_interlock,
    NV_framebuffer_blit,
    NV_framebuffer_mixed_samples,
    NV_framebuffer_multisample,
    NV_framebuffer_multisample_coverage,
    NV_generate_mipmap_sRGB,
    NV_geometry_program4,
    NV_geometry_shader_passthrough,
    NV_geometry_shader4,
    NV_gpu_multicast,
    NV_gpu_program4,
    NV_gpu_program5,
    NV_gpu_program5_mem_extended,
    NV_gpu_shader5,
    NV_half_float,
    NV_image_formats,
    NV_instanced_arrays,
    NV_internalformat_sample_query,
    NV_light_max_exponent,
    NV_memory_attachment,
    NV_memory_object_sparse,
    NV_mesh_shader,
    NV_multisample_coverage,
    NV_multisample_filter_hint,
    NV_non_square_matrices,
    NV_occlusion_query,
    NV_pack_subimage,
    NV_packed_depth_stencil,
    NV_parameter_buffer_object,
    NV_parameter_buffer_object2,
    NV_path_rendering,
    NV_path_rendering_shared_edge,
    NV_pixel_buffer_object,
    NV_pixel_data_range,
    NV_point_sprite,
    NV_polygon_mode,
    NV_present_video,
    NV_primitive_restart,
    NV_primitive_shading_rate,
    NV_query_resource,
    NV_query_resource_tag,
    NV_read_buffer,
    NV_read_buffer_front,
    NV_read_depth,
    NV_read_depth_stencil,
    NV_read_stencil,
    NV_register_combiners,
    NV_register_combiners2,
    NV_representative_fragment_test,
    NV_robustness_video_memory_purge,
    NV_sRGB_formats,
    NV_sample_locations,
    NV_sample_mask_override_coverage,
    NV_scissor_exclusive,
    NV_shader_atomic_counters,
    NV_shader_atomic_float,
    NV_shader_atomic_float64,
    NV_shader_atomic_fp16_vector,
    NV_shader_atomic_int64,
    NV_shader_buffer_load,
    NV_shader_buffer_store,
    NV_shader_noperspective_interpolation,
    NV_shader_storage_buffer_object,
    NV_shader_subgroup_partitioned,
    NV_shader_texture_footprint,
    NV_shader_thread_group,
    NV_shader_thread_shuffle,
    NV_shading_rate_image,
    NV_shadow_samplers_array,
    NV_shadow_samplers_cube,
    NV_stereo_view_rendering,
    NV_tessellation_program5,
    NV_texgen_emboss,
    NV_texgen_reflection,
    NV_texture_barrier,
    NV_texture_border_clamp,
    NV_texture_compression_s3tc_update,
    NV_texture_compression_vtc,
    NV_texture_env_combine4,
    NV_texture_expand_normal,
    NV_texture_multisample,
    NV_texture_npot_2D_mipmap,
    NV_texture_rectangle,
    NV_texture_rectangle_compressed,
    NV_texture_shader,
    NV_texture_shader2,
    NV_texture_shader3,
    NV_timeline_semaphore,
    NV_transform_feedback,
    NV_transform_feedback2,
    NV_uniform_buffer_std430_layout,
    NV_uniform_buffer_unified_memory,
    NV_vdpau_interop,
    NV_vdpau_interop2,
    NV_vertex_array_range,
    NV_vertex_array_range2,
    NV_vertex_attrib_integer_64bit,
    NV_vertex_buffer_unified_memory,
    NV_vertex_program,
    NV_vertex_program1_1,
    NV_vertex_program2,
    NV_vertex_program2_option,
    NV_vertex_program3,
    NV_vertex_program4,
    NV_video_capture,
    NV_viewport_array,
    NV_viewport_array2,
    NV_viewport_swizzle,
    NVX_blend_equation_advanced_multi_draw_buffers,
    NVX_conditional_render,
    NVX_cross_process_interop,
    NVX_gpu_memory_info,
    NVX_gpu_multicast2,
    NVX_linked_gpu_multicast,
    NVX_progress_fence,
    OES_EGL_image,
    OES_EGL_image_external,
    OES_EGL_image_external_essl3,
    OES_blend_equation_separate,
    OES_blend_func_separate,
    OES_blend_subtract,
    OES_byte_coordinates,
    OES_compressed_ETC1_RGB8_sub_texture,
    OES_compressed_ETC1_RGB8_texture,
    OES_compressed_paletted_texture,
    OES_copy_image,
    OES_depth_texture,
    OES_depth24,
    OES_depth32,
    OES_draw_buffers_indexed,
    OES_draw_elements_base_vertex,
    OES_draw_texture,
    OES_element_index_uint,
    OES_extended_matrix_palette,
    OES_fbo_render_mipmap,
    OES_fixed_point,
    OES_fragment_precision_high,
    OES_framebuffer_object,
    OES_geometry_point_size,
    OES_geometry_shader,
    OES_get_program_binary,
    OES_gpu_shader5,
    OES_mapbuffer,
    OES_matrix_get,
    OES_matrix_palette,
    OES_packed_depth_stencil,
    OES_point_size_array,
    OES_point_sprite,
    OES_primitive_bounding_box,
    OES_query_matrix,
    OES_read_format,
    OES_required_internalformat,
    OES_rgb8_rgba8,
    OES_sample_shading,
    OES_sample_variables,
    OES_shader_image_atomic,
    OES_shader_io_blocks,
    OES_shader_multisample_interpolation,
    OES_single_precision,
    OES_standard_derivatives,
    OES_stencil_wrap,
    OES_stencil1,
    OES_stencil4,
    OES_stencil8,
    OES_surfaceless_context,
    OES_tessellation_point_size,
    OES_tessellation_shader,
    OES_texture_3D,
    OES_texture_border_clamp,
    OES_texture_buffer,
    OES_texture_compression_astc,
    OES_texture_cube_map,
    OES_texture_cube_map_array,
    OES_texture_env_crossbar,
    OES_texture_float,
    OES_texture_float_linear,
    OES_texture_half_float,
    OES_texture_half_float_linear,
    OES_texture_mirrored_repeat,
    OES_texture_npot,
    OES_texture_stencil8,
    OES_texture_storage_multisample_2d_array,
    OES_texture_view,
    OES_vertex_array_object,
    OES_vertex_half_float,
    OES_vertex_type_10_10_10_2,
    OES_viewport_array,
    OML_interlace,
    OML_resample,
    OML_subsample,
    OVR_multiview,
    OVR_multiview_multisampled_render_to_texture,
    OVR_multiview2,
    PGI_misc_hints,
    PGI_vertex_hints,
    QCOM_YUV_texture_gather,
    QCOM_alpha_test,
    QCOM_binning_control,
    QCOM_driver_control,
    QCOM_extended_get,
    QCOM_extended_get2,
    QCOM_frame_extrapolation,
    QCOM_framebuffer_foveated,
    QCOM_motion_estimation,
    QCOM_perfmon_global_mode,
    QCOM_render_sRGB_R8_RG8,
    QCOM_render_shared_exponent,
    QCOM_shader_framebuffer_fetch_noncoherent,
    QCOM_shader_framebuffer_fetch_rate,
    QCOM_shading_rate,
    QCOM_texture_foveated,
    QCOM_texture_foveated_subsampled_layout,
    QCOM_texture_foveated2,
    QCOM_texture_lod_bias,
    QCOM_tiled_rendering,
    QCOM_writeonly_rendering,
    QCOM_ycbcr_degamma,
    REND_screen_coordinates,
    S3_s3tc,
    SGI_color_matrix,
    SGI_color_table,
    SGI_texture_color_table,
    SGIS_detail_texture,
    SGIS_fog_function,
    SGIS_generate_mipmap,
    SGIS_multisample,
    SGIS_pixel_texture,
    SGIS_point_line_texgen,
    SGIS_point_parameters,
    SGIS_sharpen_texture,
    SGIS_texture_border_clamp,
    SGIS_texture_color_mask,
    SGIS_texture_edge_clamp,
    SGIS_texture_filter4,
    SGIS_texture_lod,
    SGIS_texture_select,
    SGIS_texture4D,
    SGIX_async,
    SGIX_async_histogram,
    SGIX_async_pixel,
    SGIX_blend_alpha_minmax,
    SGIX_calligraphic_fragment,
    SGIX_clipmap,
    SGIX_convolution_accuracy,
    SGIX_depth_pass_instrument,
    SGIX_depth_texture,
    SGIX_flush_raster,
    SGIX_fog_offset,
    SGIX_fragment_lighting,
    SGIX_framezoom,
    SGIX_igloo_interface,
    SGIX_instruments,
    SGIX_interlace,
    SGIX_ir_instrument1,
    SGIX_list_priority,
    SGIX_pixel_texture,
    SGIX_pixel_tiles,
    SGIX_polynomial_ffd,
    SGIX_reference_plane,
    SGIX_resample,
    SGIX_scalebias_hint,
    SGIX_shadow,
    SGIX_shadow_ambient,
    SGIX_sprite,
    SGIX_subsample,
    SGIX_tag_sample_buffer,
    SGIX_texture_add_env,
    SGIX_texture_coordinate_clamp,
    SGIX_texture_lod_bias,
    SGIX_texture_multi_buffer,
    SGIX_texture_scale_bias,
    SGIX_vertex_preclip,
    SGIX_ycrcb,
    SGIX_ycrcb_subsample,
    SGIX_ycrcba,
    SUN_convolution_border_modes,
    SUN_global_alpha,
    SUN_mesh_array,
    SUN_slice_accum,
    SUN_triangle_list,
    SUN_vertex,
    SUNX_constant_data,
    VIV_shader_binary,
    WIN_phong_shading,
    WIN_specular_fog,
};

test {
    @import("std").testing.refAllDeclsRecursive(@This());
}
