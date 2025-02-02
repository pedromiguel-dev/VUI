namespace Vui.Model {
    public class Store<T>: GLib.Object {
        private T _state;

        public T state {
            get { return _state; }
            set {
                _state = value;
                changed (value);
            }
        }

        public new T get () {
            return state;
        }

        public new void set (T new_state) {
            state = new_state;
        }

        public delegate void WtachSate<G> (G new_state);

        public void watch (WtachSate<T> callback) {
            this.changed.connect (() => callback (this.get ()));
        }

        public signal void changed (T state);

        public Store (T initial_state) {
            state = initial_state;
        }
    }
}
