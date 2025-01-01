namespace Vui.Widget {
    public class App : Adw.Application {

		public Gtk.Window window;

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = window;
            }
            win.present ();
        }
    }
}
