namespace Vui.Widget {
    public class Overlay : Vui.Impl.Generic<Overlay, Gtk.Overlay> {
        public Overlay set_overlay (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> overlay) {
            widget.add_overlay (overlay.widget);
            return this;
        }

        public Overlay set_child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> child) {
            widget.child = child.widget;
            return this;
        }

        public Overlay() {
            widget = new Gtk.Overlay ();
        }
    }
}
