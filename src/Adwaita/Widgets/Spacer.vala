namespace Vui.Widget {
    public struct Separator : Vui.Impl.Wrap<Gtk.Separator, Separator> {
        public Separator(Gtk.Orientation orientation) {
            _widget = new Gtk.Separator (orientation);
        }
    }
    public struct VSpacer : Vui.Impl.Wrap<Gtk.Separator, VSpacer> {
        public VSpacer () {
            _widget = new Gtk.Separator (Gtk.Orientation.VERTICAL) { css_classes = {"spacer"} };
        }
    }
    public struct HSpacer : Vui.Impl.Wrap<Gtk.Separator, HSpacer> {
        public HSpacer () {
            _widget = new Gtk.Separator (Gtk.Orientation.HORIZONTAL) { css_classes = {"spacer"} };
        }
    }
}
