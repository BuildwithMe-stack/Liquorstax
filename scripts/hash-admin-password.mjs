import { randomBytes, scryptSync } from "node:crypto";
import { stdin, stdout } from "node:process";
import { createInterface } from "node:readline/promises";

if (!stdin.isTTY) {
  throw new Error("Run this command in an interactive terminal so the password is not exposed in shell history.");
}

const prompt = createInterface({ input: stdin, output: stdout });
const password = await prompt.question("Owner password: ");
prompt.close();
if (password.length < 12 || password.length > 1024) {
  throw new Error("Use an owner password between 12 and 1024 characters.");
}

const cost = 16_384;
const blockSize = 8;
const parallelization = 1;
const salt = randomBytes(16);
const digest = scryptSync(password, salt, 64, {
  N: cost,
  r: blockSize,
  p: parallelization,
  maxmem: 64 * 1024 * 1024,
});

stdout.write([
  "scrypt",
  cost,
  blockSize,
  parallelization,
  salt.toString("base64url"),
  digest.toString("base64url"),
].join("$") + "\n");
