namespace Vui.Flow {

    public class ShowIf : Vui.Impl.Subclass<Gtk.Box> {

        public Vui.Impl.Logistics[] content {
            set {
                foreach (var item in value) {
                    this.widget.append ((Gtk.Widget) item);
                }
            }
        }

        public ShowIf (Vui.Model.Store<bool> state) {
            this.widget = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            this.widget.set_visible (state.state);
            this.child = widget;

            state.changed.connect ((state) => {
                this.widget.set_visible (state);
            });
        }
    }
}
