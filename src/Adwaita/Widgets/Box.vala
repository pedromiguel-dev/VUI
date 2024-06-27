namespace Vui.Widget {
    public class HBox : Vui.Impl.Generic<HBox, Gtk.Box> {
        public HBox spacing (int spacing) {
            widget.set_spacing (spacing);
            return this;
        }

        public HBox (params Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget>[]? children) {
            widget = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            if(children != null) {
                foreach (var item in children)
                    widget.append (item.widget);
            }
        }
    }

    public class VBox : Vui.Impl.Generic<VBox, Gtk.Box> {
        public VBox spacing (int spacing) {
            widget.set_spacing (spacing);
            return this;
        }

        public VBox (params Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget>[]? children) {
            widget = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            if(children != null) {
                foreach (var item in children)
                    widget.append (item.widget);
            }
        }
    }
}
