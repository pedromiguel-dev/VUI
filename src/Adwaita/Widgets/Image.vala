namespace Vui.Widget {
    public struct Image : Vui.Impl.Wrap<Gtk.Image, Image> {

        public Image pixel_size (int size) {
            _widget.set_pixel_size (size);
            return this;
        }
        public Image () {
            _widget = new Gtk.Image ();
        }
        public Image.from_icon_name (string? icon_name) {
            _widget = new Gtk.Image.from_icon_name (icon_name);
        }
        public Image.from_resource (string? resource_path) {
            _widget = new Gtk.Image.from_resource (resource_path);
        }
    }

    public struct Picture : Vui.Impl.Wrap<Gtk.Picture, Picture> {

        public Picture () {
            _widget = new Gtk.Picture ();
        }
        public Picture.for_paintable (Gdk.Paintable ? paintable) {
            _widget = new Gtk.Picture.for_paintable (paintable);
        }
        public Picture.for_file (GLib.File ? file) {
            _widget = new Gtk.Picture.for_file (file);
        }
        public Picture.for_resource (string? resource_path) {
            _widget = new Gtk.Picture.for_resource (resource_path);
        }
        public Picture.for_filename (string? filename) {
            _widget = new Gtk.Picture.for_filename (filename);
        }
    }
}