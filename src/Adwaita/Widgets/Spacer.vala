namespace Vui.Widget {
    public class Separator : Vui.Impl.Subclass<Gtk.Separator> {

        public Separator (Gtk.Orientation orientation) {
            widget = new Gtk.Separator (orientation);
            this.child = widget;
        }
    }
    public class VSpacer : Vui.Impl.Subclass<Gtk.Separator> {

        public VSpacer () {
            widget = new Gtk.Separator (Gtk.Orientation.VERTICAL);
            this.child = widget;
        }
    }
    public class HSpacer : Vui.Impl.Subclass<Gtk.Separator> {

        public HSpacer () {
            widget = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
            this.child = widget;
        }
    }
}
