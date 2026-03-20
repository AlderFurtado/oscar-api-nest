
import { Injectable } from '@nestjs/common';
import { PrismaPg } from '@prisma/adapter-pg'
import { PrismaClient } from 'generated/prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  constructor() {
    const adapter = new PrismaPg({
      host: process.env.DB_HOST ?? "db",
      port: parseInt(process.env.DB_PORT ?? "5432"),
      user: process.env.DB_USER ?? "postgres",
      password: process.env.DB_PASSWORD ?? "example",
      database: process.env.DB_NAME ?? "oscar"
        });
    super({ adapter });
  }
}
