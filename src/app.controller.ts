import { Controller, Get, HttpCode, HttpStatus, Response } from '@nestjs/common';
import { AppService } from './app.service';
import { response } from 'express';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @HttpCode(HttpStatus.OK)
  @Get("health_check")
  getHello(): string {
    return "ok";
  }
}
