namespace Vui {

    public class Flow.ShowIf : Impl.View {
        private Gtk.Box box_widget = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

        public Impl.View[] content {
            set {
                foreach (var item in value) {
                    this.box_widget.append ((Gtk.Widget) item);
                }
            }
        }

        public ShowIf (Model.Store<bool> state) {
            this.box_widget.set_visible (state.state);
            this.set_widget (box_widget);

            state.changed.connect ((state) => {
                this.box_widget.set_visible (state);
            });
        }
    }
}
