namespace Vui {

    public class Flow.Watch<G>: Widget.Box {

        private Model.Store<G> st;

        public delegate Gtk.Widget[] FlowWatchContent ();

        private FlowWatchContent render;

        public new Gtk.Widget[] content {
            set {
                foreach (var item in this.children) {
                    item.unparent ();
                }

                foreach (var item in value) {
                    this.append ((Gtk.Widget) item);
                }
                this.render = () => { return value; };
            }
        }

        public Watch (Model.Store<G> state) {
            this.st = state;
            this.spacing = 0;

            state.changed.connect (() => {
                this.content = render ();
            });
        }
    }

    public class Flow.ShowIf : Impl.View {
        private Widget.VBox box_widget = new Widget.VBox (0);

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
