namespace Vui.Widget {
    public struct Overlay : Vui.Impl.Wrap<Gtk.Overlay, Overlay> {
        public Overlay set_overlay (Vui.Impl.Wrap overlay) {
            _widget.add_overlay (overlay.widget);
            return this;
        }

        public Overlay set_child (Vui.Impl.Wrap child) {
            _widget.child = child.widget;
            return this;
        }

        public Overlay() {
            widget = new Gtk.Overlay ();
        }
    }
}
