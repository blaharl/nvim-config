// Problem: $(PROBLEM)
// Contest: $(CONTEST)
// Judge: $(JUDGE)
// URL: $(URL)
// Memory Limit: $(MEMLIM)
// Time Limit: $(TIMELIM)
// Start: $(DATE)

use std::io::{stdin, stdout, BufWriter, Write};

#[derive(Default)]
struct Scanner {
    buffer: Vec<String>,
}
impl Scanner {
    fn next<T: std::str::FromStr>(&mut self) -> T {
        loop {
            if let Some(token) = self.buffer.pop() {
                return token.parse().ok().expect("Failed parse");
            }
            let mut input = String::new();
            stdin().read_line(&mut input).expect("Failed read");
            self.buffer = input.split_whitespace().rev().map(String::from).collect();
        }
    }
}

fn main() {
    let mut scan = Scanner::default();
    // write(ln)!(out, "string format").ok()
    let out = &mut BufWriter::new(stdout());

    let mut n = 0;
    if n != 1 {
        n = scan.next();
    }
    for _ in 0..n {
        solve(&mut scan, &mut *out);
    }
}

fn solve(scan: &mut Scanner, mut out: impl Write) {
    // let p: Vec<_> = (0..n).map(|_| (scan.next(), scan.next())).collect();
    // let s = format!("R{}R", scan.next::<String>());
}
