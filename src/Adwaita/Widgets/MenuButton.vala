namespace Vui.Widget {
    public class MenuButton : Vui.Impl.Generic<MenuButton, Gtk.MenuButton> {

        public MenuButton icon_name (string name){
            widget.set_icon_name (name);
            return this;
        }

        public MenuButton (Vui.Impl.Generic<Vui.Impl.Generic, Gtk.Widget> popover) {
            var ppvr = new Gtk.Popover () { child = popover.widget };
            widget = new Gtk.MenuButton () { popover = ppvr};
        }
    }
}
