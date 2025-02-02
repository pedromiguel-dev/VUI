subdir('Icons')

sources = [
  'Init.vala',
  'Implementation' / 'Flow.vala',
  'Implementation' / 'Impl.vala',
  'Model' / 'Store.vala',
  'Widgets' / 'AlertDialog.vala',
  'Widgets' / 'Application.vala',
  'Widgets' / 'Box.vala',
  'Widgets' / 'Button.vala',
  'Widgets' / 'Dialog.vala',
  'Widgets' / 'Entry.vala',
  'Widgets' / 'HeaderBar.vala',
  'Widgets' / 'Image.vala',
  'Widgets' / 'Label.vala',
  'Widgets' / 'MenuButton.vala',
  'Widgets' / 'Navigation.vala',
  'Widgets' / 'Overlay.vala',
  'Widgets' / 'Page.vala',
  'Widgets' / 'ScrolledBox.vala',
  'Widgets' / 'Spacer.vala',
  'Widgets' / 'Toolbar.vala',
  'Widgets' / 'Window.vala',
]

## LIB
vui_sources = sources + gnome.compile_resources('vui-resources', 'vui.gresource.xml', c_name: 'vui')

vui_gi_name = 'Vui'
vui_gi_version = '0.1.0'

vui_gi = vui_gi_name + '-' + vui_gi_version
vui_gir = vui_gi + '.gir'
vui_typelib = vui_gi + '.typelib'

include_dir = join_paths(get_option('prefix'), get_option('includedir'), meson.project_name())

libvui = library(
  meson.project_name(),

  vui_sources,
  icons_resource,

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
  install_dir: [true, true, true, true],
)

install_data('vui-1.deps', install_dir: join_paths(get_option('datadir'), 'vala', 'vapi'))

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
  version: meson.project_version(),
  url: 'https://github.com/pedromigueldev/vui',
)
