namespace Vui.Widget {
    public struct Page : Vui.Impl.Wrap<Adw.NavigationPage, Page> {

        public Page can_pop (bool can_pop) {
            _widget.set_can_pop (can_pop);
            return this;
        }

        public Page child (Vui.Impl.Wrap child) {
            _widget.set_child (child.widget);
            return this;
        }

        public Page (string title) {
           widget = new Adw.NavigationPage (new Gtk.Box (Gtk.Orientation.VERTICAL, 0), title);
           _widget.set_tag (title);
        }
    }
}
