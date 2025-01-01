namespace Vui.Widget {
    public struct ScrolledBox : Vui.Impl.Wrap<Gtk.ScrolledWindow, ScrolledBox>  {

        public ScrolledBox vscrollbar_policy (Gtk.PolicyType vscrollbar_policy ) {
            _widget.vscrollbar_policy = vscrollbar_policy;
            return this;
        }

        public ScrolledBox hscrollbar_policy (Gtk.PolicyType hscrollbar_policy ) {
            _widget.hscrollbar_policy = hscrollbar_policy;
            return this;
        }

        public ScrolledBox (Vui.Impl.Wrap child) {
            _widget = new Gtk.ScrolledWindow ();
            _widget.set_child (child.widget);
        }
    }
}
