namespace Vui.Widget {

    public struct HBox : Vui.Impl.Wrap<Gtk.Box, HBox> {
        public HBox spacing (int spacing) {
            _widget.set_spacing (spacing);
            return this;
        }

        public HBox (Vui.Impl.Wrap?[] children = {}) {
            _widget = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

            if(children != null)
                foreach (var child in children)
                    _widget.append (child.widget);
        }
    }

    public struct VBox : Vui.Impl.Wrap<Gtk.Box, VBox> {

        public VBox spacing (int spacing) {
            _widget.set_spacing (spacing);
            return this;
        }

        public VBox (Vui.Impl.Wrap[] children) {
            _widget = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

            if(children != null)
                foreach (var child in children)
                    _widget.append (child.widget);
        }
    }
}
