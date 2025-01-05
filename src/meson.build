sources = [
  'Init.vala',
  'Adwaita' / 'Implementation' / 'WidgetGeneric.vala',
  'Adwaita' / 'Implementation' / 'Callbacks.vala',
  'Adwaita' / 'Model' / 'Store.vala',
  'Adwaita' / 'Widgets' / 'AlertDialog.vala',
  'Adwaita' / 'Widgets' / 'App.vala',
  'Adwaita' / 'Widgets' / 'Application.vala',
  'Adwaita' / 'Widgets' / 'Bin.vala',
  'Adwaita' / 'Widgets' / 'Box.vala',
  'Adwaita' / 'Widgets' / 'Button.vala',
  'Adwaita' / 'Widgets' / 'Dialog.vala',
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

## LIB
vui_sources = sources + gnome.compile_resources('vui-resources', 'vui.gresource.xml', c_name: 'vui')

vui_gi_name = 'Vui'
vui_gi_version = '0.1.0'

vui_gi = vui_gi_name + '-' + vui_gi_version
vui_gir = vui_gi + '.gir'
vui_typelib = vui_gi + '.typelib'

vui_deps = [dependency('gtk4'), dependency('libadwaita-1', version: '>= 1.4')]

include_dir = join_paths(get_option('prefix'), get_option('includedir'), meson.project_name())

libvui = library(
  meson.project_name(),

  vui_sources,

  dependencies: [
    vui_deps,
    meson.get_compiler('c').find_library('m'),
    meson.get_compiler('vala').find_library('posix'),
  ],

  vala_header: 'vui.h',
  vala_vapi: 'vui.vapi',
  vala_gir: vui_gir,

  version: meson.project_version(),
  install: true,
  install_dir: [true, include_dir, true, true],
)

# install_data(
#     'vui-1.deps',
#     install_dir: join_paths(get_option('datadir'), 'vala', 'vapi')
# )

g_ir_compiler = find_program('g-ir-compiler')
custom_target(
  vui_typelib,
  command: [
    g_ir_compiler,
    '--shared-library', '@PLAINNAME@',
    '--output', '@OUTPUT@',
    join_paths(meson.current_build_dir(), vui_gir),
  ],
  input: libvui,
  output: vui_typelib,
  depends: libvui,
  install: true,
  install_dir: join_paths(get_option('libdir'), 'girepository-1.0'),
)

libvui_dep = declare_dependency(
  link_with: libvui,
  dependencies: vui_deps,
  include_directories: [include_directories('.')],
)

pkgconfig.generate(
  libvui,
  name: meson.project_name(),
  description: 'A vala UI framework.',
  requires: vui_deps,
)

## DEMO

demo_sources = sources + ['demo' / 'main.vala', 'demo' / 'window.vala', 'demo' / 'application.vala']
demo_sources = demo_sources + gnome.compile_resources('demo-resources', 'demo/demo.gresource.xml', c_name: 'vui')

executable(
  'vui',
  demo_sources,
  dependencies: vui_deps,
  install: true,
)
