
import { Injectable } from '@nestjs/common';
import { PrismaPg } from '@prisma/adapter-pg'
import { PrismaClient } from 'generated/prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  constructor() {
    const adapter = new PrismaPg({
      host: "db",
      port: 5432,
      user: "postgres",
      password: "example",
      database: "oscar"
    });
    super({ adapter });
  }
}
