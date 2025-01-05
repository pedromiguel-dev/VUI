
public class Vui.Widget.ToolBar : Vui.Impl.Generic<Adw.ToolbarView> {

    public Vui.Impl.Generic top_bar {
        set {
            widget.add_top_bar (value.gtk_widget);
        }
    }
    public Vui.Impl.Generic bottom_bar {
        set {
            widget.add_bottom_bar  (value.gtk_widget);
        }
    }
    public Vui.Impl.Generic content {
        set {
            widget.set_content (value.gtk_widget);
        }
    }
    public ToolBar () {
        widget = new Adw.ToolbarView ();
    }
}
