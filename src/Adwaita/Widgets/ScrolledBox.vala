namespace Vui.Widget {
    public class ScrolledBox : Vui.Impl.Generic<ScrolledBox, Gtk.ScrolledWindow >  {

        public ScrolledBox vscrollbar_policy (Gtk.PolicyType vscrollbar_policy ) {
            widget.vscrollbar_policy = vscrollbar_policy;
            return this;
        }

        public ScrolledBox hscrollbar_policy (Gtk.PolicyType hscrollbar_policy ) {
            widget.hscrollbar_policy = hscrollbar_policy;
            return this;
        }

        public ScrolledBox (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> child) {
            widget = new Gtk.ScrolledWindow ();
            widget.set_child (child.widget);
        }
    }
}
