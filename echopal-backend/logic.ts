// 业务逻辑层：只负责处理数据与返回结果

export function getHealthStatus(): { status: string } {
  return { status: 'ok' };
}

export function getPingMessage(): { message: string } {
  return { message: 'pong' };
}