sources = ['application.vala', 'main.vala', 'window.vala']

demo_sources = sources + gnome.compile_resources('demo-resources', 'demo.gresource.xml', c_name: 'demo')

executable(
  'demo',
  demo_sources,
  dependencies: [libvui_dep],
  install: true,
)
