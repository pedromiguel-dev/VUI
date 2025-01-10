namespace Vui.Widget {
    public class MenuButton : Vui.Impl.Subclass<Gtk.MenuButton> {

        public Gtk.Widget content {
            set {
                Vui.Impl.BoubleDestination (value, this);
                widget.set_popover (new Gtk.Popover () { child = value });
            }
        }

        public MenuButton () {
            widget = new Gtk.MenuButton ();
            this.child = widget;
        }
    }
}
