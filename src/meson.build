vui_sources = [
  'Adwaita' / 'Implementation' / 'WidgetGeneric.vala',
  'Adwaita' / 'Model' / 'Store.vala',
  'Adwaita' / 'Widgets' / 'AlertDialog.vala',
  'Adwaita' / 'Widgets' / 'App.vala',
  'Adwaita' / 'Widgets' / 'Bin.vala',
  'Adwaita' / 'Widgets' / 'Box.vala',
  'Adwaita' / 'Widgets' / 'Button.vala',
  'Adwaita' / 'Widgets' / 'Entry.vala',
  'Adwaita' / 'Widgets' / 'HeaderBar.vala',
  'Adwaita' / 'Widgets' / 'Image.vala',
  'Adwaita' / 'Widgets' / 'Label.vala',
  'Adwaita' / 'Widgets' / 'MenuButton.vala',
  'Adwaita' / 'Widgets' / 'Navigation.vala',
  'Adwaita' / 'Widgets' / 'Overlay.vala',
  'Adwaita' / 'Widgets' / 'Page.vala',
  'Adwaita' / 'Widgets' / 'ScrolledBox.vala',
  'Adwaita' / 'Widgets' / 'Spacer.vala',
  'Adwaita' / 'Widgets' / 'Toolbar.vala',
  'Adwaita' / 'Widgets' / 'Window.vala',
]

vui_sources += [
  'main.vala',
  'application.vala',
  'window.vala',
]

vui_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.4'),
]

vui_sources += gnome.compile_resources('vui-resources',
  'vui.gresource.xml',
  c_name: 'vui'
)

executable('vui', vui_sources,
  dependencies: vui_deps,
       install: true,
)

libvui = library(
  'vui',
  vui_sources,

  dependencies: [
          vui_deps,
	  meson.get_compiler('c').find_library('m'),
          meson.get_compiler('vala').find_library('posix')
  ],
  vala_header: 'vui.h',
  vala_vapi: 'vui.vapi',
  version: '0.1',
  install: true,
)
