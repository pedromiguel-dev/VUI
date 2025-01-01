namespace Vui.Widget {
    using Vui.Impl;
    public struct ToolBar : Vui.Impl.Wrap<Adw.ToolbarView, ToolBar> {
        public ToolBar (Vui.Impl.Wrap top, Vui.Impl.Wrap content,  Vui.Impl.Wrap? bottom_bar = null ) {
            _widget = new Adw.ToolbarView ();
            _widget.add_top_bar (top.widget);
            _widget.set_content (content.widget);
            _widget.add_bottom_bar (bottom_bar == null ? new Gtk.Box (Gtk.Orientation.VERTICAL ,0) : bottom_bar.widget);
        }
    }
}
