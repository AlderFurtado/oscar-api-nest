import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { PrismaService } from 'src/prisma.service';

@Module({
  providers: [UsersService,PrismaService],
  // export UsersService so other modules (eg. AuthModule) that import
  // UsersModule can inject UsersService
  exports: [UsersService]
})
export class UsersModule {}
