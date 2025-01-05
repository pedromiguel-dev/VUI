public class Vui.Widget.Overlay : Vui.Impl.Generic<Gtk.Overlay> {

    public Vui.Impl.Generic overlay {
        set {
            widget.add_overlay (value.gtk_widget);
        }
    }

    public Vui.Impl.Generic content {
        set {
            widget.set_child (value.gtk_widget);
        }
    }

    public Overlay () {
        widget = new Gtk.Overlay ();
    }
}
