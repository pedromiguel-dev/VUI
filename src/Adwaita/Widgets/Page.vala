namespace Vui.Widget {
    public class Page : Vui.Impl.Generic<Adw.NavigationPage> {

        public bool can_pop  {
            set {
                widget.set_can_pop (value);
            }
        }

        public Vui.Impl.Generic child {
            set {
                widget.set_child (value.gtk_widget);
            }
        }

        public Page (string title) {
            widget = new Adw.NavigationPage (new Gtk.Box (Gtk.Orientation.VERTICAL, 0), title);
            widget.set_tag (title);
        }
    }
}
