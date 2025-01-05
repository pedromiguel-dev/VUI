namespace Vui.Widget {
    public class MenuButton : Vui.Impl.Generic<Gtk.MenuButton> {

        public string icon_name {
            set {
                widget.set_icon_name (value);
            }
        }

        public MenuButton (Vui.Impl.Generic popover) {
            var tmp = new Gtk.Popover () { child = popover.gtk_widget };
            widget = new Gtk.MenuButton () { popover = tmp };
        }
    }
}
