namespace Vui.Widget {
    public class Image : Vui.Impl.Generic<Gtk.Image> {

        public int pixel_size {
            set {
                widget.set_pixel_size (value);
            }
        }

        public Image () {
            widget = new Gtk.Image ();
        }

        public Image.from_icon_name (string? icon_name) {
            widget = new Gtk.Image.from_icon_name (icon_name);
        }
        public Image.from_resource (string? resource_path) {
            widget = new Gtk.Image.from_resource (resource_path);
        }
    }

    public class Picture : Vui.Impl.Generic<Gtk.Picture> {

        public Picture () {
            widget = new Gtk.Picture ();
        }

        public Picture.for_paintable (Gdk.Paintable ? paintable) {
            widget = new Gtk.Picture.for_paintable (paintable);
        }
        public Picture.for_file (GLib.File ? file) {
            widget = new Gtk.Picture.for_file (file);
        }
        public Picture.for_resource (string? resource_path) {
            widget = new Gtk.Picture.for_resource (resource_path);
        }
        public Picture.for_filename (string? filename) {
            widget = new Gtk.Picture.for_filename (filename);
        }
    }
}
