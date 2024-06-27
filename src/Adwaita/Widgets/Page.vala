namespace Vui.Widget {
    public class Page : Vui.Impl.Generic<Page, Adw.NavigationPage> {

        public Page can_pop (bool can_pop) {
            this.widget.set_can_pop (can_pop);
            return this;
        }

        public Page child (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> c) {
            widget.set_child (c.widget);
            return this;
        }

        public Page (string title) {
           widget = new Adw.NavigationPage (new Gtk.Box (Gtk.Orientation.VERTICAL, 0), title);
           widget.set_tag (title);
        }
    }
}
