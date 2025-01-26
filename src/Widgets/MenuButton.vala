namespace Vui {
    public class Widget.MenuButton : Impl.View {

        public Gtk.MenuButton menubutton_widget = new Gtk.MenuButton ();

        public Impl.View content {
            set {
                this.destination = value.destination;
                menubutton_widget.set_popover (new Gtk.Popover () { child = value });
            }
        }

        public MenuButton () {
            this.set_widget (menubutton_widget);
        }
    }
}
