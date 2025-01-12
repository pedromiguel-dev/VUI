namespace Vui.Widget {
    public class Separator : Vui.Impl.Subclass<Gtk.Separator> {
        public Separator (Gtk.Orientation orientation) {
            widget = new Gtk.Separator (orientation);
            this.child = widget;
        }
    }
    public class VSpacer : Vui.Impl.Subclass<Gtk.Separator> {
        public VSpacer () {
            this.vexpand = true;
            widget = new Gtk.Separator (Gtk.Orientation.VERTICAL) {
                css_classes = { "spacer" }
            };
            this.child = widget;
        }
    }
    public class HSpacer : Vui.Impl.Subclass<Gtk.Separator> {
        public HSpacer () {
            this.hexpand = true;
            widget = new Gtk.Separator (Gtk.Orientation.HORIZONTAL) {
                css_classes = { "spacer" }
            };
            this.child = widget;
        }
    }
}
