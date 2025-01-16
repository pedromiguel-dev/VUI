public class ScrolledBox : Vui.Impl.Subclass<Gtk.ScrolledWindow> {

    public Gtk.PolicyType vscroll_policy {
        set {
            widget.vscrollbar_policy = value;
        }
    }

    public Gtk.PolicyType hscroll_policy {
        set {
            widget.hscrollbar_policy = value;
        }
    }

    public Gtk.Widget content {
        set {
            Vui.Impl.BoubleDestination (value, this);
            this.set_child (value);
        }
    }

    public ScrolledBox () {
        widget = new Gtk.ScrolledWindow ();
        this.child = widget;
    }
}
