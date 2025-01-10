
public class Vui.Widget.ToolBar : Vui.Impl.Subclass<Adw.ToolbarView> {

    public Gtk.Widget top_bar {
        set {
            Vui.Impl.BoubleDestination (value, this);
            widget.add_top_bar (value);
        }
    }
    public Gtk.Widget bottom_bar {
        set {
            Vui.Impl.BoubleDestination (value, this);
            widget.add_bottom_bar (value);
        }
    }
    public Gtk.Widget content {
        set {
            Vui.Impl.BoubleDestination (value, this);
            widget.set_content (value);
        }
    }
    public ToolBar () {
        widget = new Adw.ToolbarView ();
        this.child = widget;
    }
}
