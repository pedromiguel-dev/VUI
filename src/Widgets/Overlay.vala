public class Vui.Widget.Overlay : Vui.Impl.Subclass<Gtk.Overlay> {

    public Gtk.Widget overlay {
        set {
            Vui.Impl.BoubleDestination (value, this);
            widget.add_overlay (value);
        }
    }

    public Gtk.Widget content {
        set {
            Vui.Impl.BoubleDestination (value, this);
            widget.set_child (value);
        }
    }

    public Overlay () {
        widget = new Gtk.Overlay ();
        this.child = widget;
    }
}
