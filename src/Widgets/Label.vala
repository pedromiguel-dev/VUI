namespace Vui {

    public class Widget.Label : Impl.View {
        private Gtk.Label label_widget;

        public bool wrap {
            set {
                label_widget.set_wrap (value);
                label_widget.set_wrap_mode (Pango.WrapMode.WORD_CHAR);
            }
        }

        public int lines {
            set {
                label_widget.set_lines (value);
            }
        }

        public Pango.EllipsizeMode ellipsize {
            set {
                label_widget.set_ellipsize (value);
            }
        }

        public Label.ref (Model.Store<string> state) {
            label_widget = new Gtk.Label (state.state);
            if (state != null)
                state.changed.connect ((text) => {
                    label_widget.label = text;
                });
            this.set_widget (label_widget);
        }

        public Label (string label) {
            label_widget = new Gtk.Label (label);
            this.set_widget (label_widget);
        }
    }
}
