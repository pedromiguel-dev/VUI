namespace Vui.Widget {
    using Vui.Impl;
    public class ToolBar : Generic<ToolBar, Adw.ToolbarView> {

        public ToolBar (Generic<Generic, Gtk.Widget> top, Generic<Generic, Gtk.Widget> content,  Generic<Generic, Gtk.Widget>? bottom_bar = null ) {
            widget = new Adw.ToolbarView ();
            widget.add_top_bar (top.widget);
            widget.set_content (content.widget);
            widget.add_bottom_bar (bottom_bar == null ? new Gtk.Box (Gtk.Orientation.VERTICAL,0) : bottom_bar.widget);
        }
    }
}
