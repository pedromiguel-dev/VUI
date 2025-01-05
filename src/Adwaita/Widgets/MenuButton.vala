namespace Vui.Widget {
    public class MenuButton : Vui.Impl.Generic<Gtk.MenuButton> {

        public string icon_name {
            set {
                widget.set_icon_name (value);
            }
        }

        public Vui.Impl.Generic content {
            set {
                this.widget.set_popover (new Gtk.Popover () { child = value.gtk_widget });
            }
        }

        public MenuButton () {
            widget = new Gtk.MenuButton ();
        }
    }
}
