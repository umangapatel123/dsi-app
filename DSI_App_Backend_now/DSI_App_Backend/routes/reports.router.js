import { Router } from "express";
import { storeReportData
 } from "../controllers/users.controller.js";

const router = Router();
router.route("/store-report-data").post(storeReportData);

export default router;