public class ScrolledBox : Vui.Impl.Generic<Gtk.ScrolledWindow>  {

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

    public Vui.Impl.Generic child {
        set {
            widget.set_child (value.gtk_widget);
        }
    }

    public ScrolledBox () {
        widget = new Gtk.ScrolledWindow ();
    }
}
