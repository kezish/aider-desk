export const DEFAULT_SERVER_PORT = 24337;

export const resolveServerPort = (value?: string): number => {
  if (!value) {
    return DEFAULT_SERVER_PORT;
  }

  const port = Number.parseInt(value, 10);
  if (!Number.isInteger(port) || port < 1 || port > 65535) {
    throw new Error(`Invalid AIDER_DESK_PORT: ${value}`);
  }

  return port;
};
