Red/System []

#switch OS [ 
    Windows [
    	#define csfml       "libs/csfml-wrapper.dll"
    	#define sprite-lib  csfml
    	#define texture-lib csfml
    	#define window-lib  csfml
    	#define calling     cdecl
    ]
    Mac []
    Linux []
]

#define sf-render-window! byte-ptr!
#define sf-sprite!        byte-ptr! 
#define sf-clock!         byte-ptr!
#define sf-texture!       byte-ptr!

 #include %arrays.reds

sf-video-mode!: alias struct! [
	width          [integer!]
	height         [integer!]
	bits-per-pixel [integer!]
]

sf-context-settings!: alias struct! [
    depth-bits          [integer!]  ; Bits of the depth buffer
    stencil-bits        [integer!]  ; Bits of the stencil buffer
    anti-aliasing-level [integer!]  ; Level of antialiasing
    major-version       [integer!]  ; Major number of the context version to create
    minor-version       [integer!]  ; Minor number of the context version to create
    attribute-flags     [integer!]  ; The attribute flags to create the context with
]

vector!: alias struct! [
    x  [float32!] 
    y  [float32!]
]



#enum sf-event-type! [
	sf-event-closed                 
    sf-event-resized                
    sf-event-lost-focus              
    sf-event-gained-focus            
    sf-event-text-entered            
    sf-event-key-pressed        
    sf-event-key-released            
    sf-event-mouse-wheel-moved        
    sf-event-mouse-wheel-scrolled    
    sf-event-mouse-button-pressed     
    sf-event-mouse-button-released   
    sf-event-mouse-moved             
    sf-event-mouse-entered           
    sf-event-mouse-left              
    sf-event-joystick-button-pressed  
    sf-event-joystick-button-released 
    sf-event-joystick-moved          
    sf-event-joystick-connected      
    sf-event-joystick-disconnected   
    sf-event-touch-began            
    sf-event-touch-moved             
    sf-event-touch-ended             
    sf-event-sensor-changed         

    sf-event-count                  
]

sf-event!: alias struct! [
    type [integer!]
]

sf-time!: alias struct! [
	pad1 [integer!]
	pad2 [integer!]
]


#import [
	csfml calling [
		sf-clock-create: "sf_clock_create" [
			return: [sf-clock!]
		]
		sf-clock-destroy: "sf_clock_destroy" [
			sf-clock [sf-clock!]
		]
		sf-clock-restart: "sf_clock_restart" [
			sf-clock [sf-clock!]
			return: [sf-time!]
		]
		sf-time-zero: "sf_time_zero" [
			return: [sf-time!]
		]
		sf-time-per-frame: "sf_time_per_frame" [
			return: [sf-time!]
		]
		sf-time-get-milliseconds: "sf_time_get_milliseconds" [
			return: [integer!]
		]
		sf-time-set-subtract: "sf_time_subtract" [
			this    [sf-time!]
			other   [sf-time!]		]
		sf-time-set-add: "sf_time_set_add" [
			this    [sf-time!]
			other   [sf-clock!]
			return: [sf-time!]
		]
		sf-time-print: "sf_time_print" [
			this [sf-time!]
		]
		print-integer: "print_integer" [
			in [integer!]
		]
		start: "start" [
			width          [integer!]
			height         [integer!]
			title          [c-string!]
			init-screen    [function! []]
			process-events [function! [
						   		window [sf-render-window!] 
						   		event  [sf-event!]
						   ]]
			update         [function! [time [integer!]]]
			render         [function! [window [sf-render-window!]]]
			shut-down      [function! []]
		]
		sf-time-get-time: "sf_time_get_time" [
			time    [sf-time!]
			return: [float!]
		]
	]
]

#import [
	window-lib calling [
		sf-render-window-create: "sf_render_window_create" [
			width   [integer!]
			height  [integer!]
			title   [c-string!]
			return: [sf-render-window!]
		]
		sf-render-window-open?: "sf_render_window_is_open" [
			window  [sf-render-window!]
			return: [logic!]
		]
		sf-render-window-poll-event: "sf_render_window_poll_event" [
			window [sf-render-window!]
			event  [sf-event!]
			return: [logic!]
		]
		sf-render-window-set-title: "sf_render_window_set_title" [
			window [sf-render-window!]
			title  [c-string!]
		]
		sf-render-window-close: "sf_render_window_close" [
			window [sf-render-window!]
		]
		sf-render-window-destroy: "sf_render_window_destroy" [
			window [sf-render-window!]
		]
		sf-render-window-draw-sprite: "sf_render_window_draw_sprite" [	
			window [sf-render-window!]
			sprite [sf-sprite!]
		]
		sf-render-window-clear: "sf_render_window_clear" [
			window [sf-render-window!]
		]
		sf-render-window-display: "sf_render_window_display" [
			window [sf-render-window!]
		]

	]
]

#import [
	texture-lib calling [
		sf-texture-create: "sf_texture_create" [
			file-location [c-string!]
			return:       [sf-texture!]
		]
		sf-texture-destroy: "sf_texture_destroy" [
			file-location [sf-texture!]
		]
	]
]

#import [
	sprite-lib calling [
		sf-sprite-create: "sf_sprite_create" [
			return: [sf-sprite!]
		]
		sf-sprite-set-texture: "sf_sprite_set_texture" [
			sprite  [sf-sprite!]
			texture [sf-texture!]
		]
		sf-sprite-set-position: "sf_sprite_set_position" [
			sprite [sf-sprite!]
			x      [float32!]
			y      [float32!]
		] 
		sf-sprite-destroy: "sf_sprite_destroy" [
			sprite [sf-sprite!]
		]
		sf-vector-create: "sf_vector_create" [
			x [float32!]
			y [float32!]
			return: [vector!]
		]
	]
]

;test-lib 
