namespace Vui.Widget {
    public class Separator : Vui.Impl.Generic<Gtk.Separator> {
        public Separator (Gtk.Orientation orientation) {
            widget = new Gtk.Separator (orientation);
        }
    }
    public class VSpacer : Vui.Impl.Generic<Gtk.Separator> {
        public VSpacer () {
            widget = new Gtk.Separator (Gtk.Orientation.VERTICAL);
        }
    }
    public class HSpacer : Vui.Impl.Generic<Gtk.Separator> {
        public HSpacer () {
            widget = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        }
    }
}
