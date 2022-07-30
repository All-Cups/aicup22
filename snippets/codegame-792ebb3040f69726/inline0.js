
                    export function run(main_loop) {
                        function main_loop_wrapper() {
                            if (main_loop()) {
                                window.setTimeout(main_loop_wrapper);
                            }
                        }
                        main_loop_wrapper();
                    }
                    