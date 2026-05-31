<?php
class AdminController extends Controller
{
    public function __construct()
    {
        $this->requireAdmin();
    }

    // Override render để dùng admin layout
    protected function render(string $view, array $data = [], string $layout = 'layouts.admin_layout'): void
    {
        extract($data);
        $viewFile = VIEW_PATH . str_replace('.', '/', $view) . '.php';
        if (!file_exists($viewFile)) die("View không tồn tại: $viewFile");

        ob_start();
        require $viewFile;
        $__adminContent = ob_get_clean(); // Dùng tên khác tránh conflict với extract

        $layoutFile = VIEW_PATH . str_replace('.', '/', $layout) . '.php';
        if (file_exists($layoutFile)) {
            $content = $__adminContent; // Gán lại cho layout dùng
            require $layoutFile;
        } else {
            echo $__adminContent;
        }
    }
}