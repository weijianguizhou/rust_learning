use std::io;
use std::io::Read;
fn main() {
    let mut s = String::new();
    io::stdin().read_to_string(&mut s).unwrap();
    let mut it = s.split_whitespace();
    let a: i64 = it.next().unwrap().parse().unwrap();
    let b: i64 = it.next().unwrap().parse().unwrap();
    let c: i64 = it.next().unwrap().parse().unwrap();
    println!("{b}")
}
